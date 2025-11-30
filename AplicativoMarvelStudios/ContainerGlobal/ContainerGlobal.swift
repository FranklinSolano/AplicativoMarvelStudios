//
//  ContainerGlobal.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/07/25.
//
import Foundation

// MARK: - 1. Seus componentes e serviços

// Protocolos para os serviços que serão injetados
protocol DesignSystemComponentsInterface {
    func makeLabel() -> Labeling
    func makeTextField() -> TextFielding
    func makeButton() -> Buttoning
    func makeButtonTitles() -> Buttoning
    func makeButtonImage() -> ButtonImageing
    func makeTableView() -> TableViewing
    func makeCollectionView() -> CollectionViewing
    func makeActivityIndicator() -> LoadingIndicatable
    func makeImageView() -> ImageViewing
    func makeSearchBar() -> SearchBaring
    func makeSegmentedControling() -> SegmentedControling
}

final class DesignSystemComponents: DesignSystemComponentsInterface {
    func makeLabel() -> Labeling {
        return DSLabelAdapter()
    }
    
    func makeTextField() -> TextFielding {
        return DSTextFieldAdapter()
    }
    func makeButton() -> Buttoning {
        return DSButtonAdapter()
    }
    
    func makeButtonTitles() -> Buttoning {
        return DSButtonTitlesAdapter()
    }
    
    func makeButtonImage() -> ButtonImageing {
        return DSButtonImageAdapter()
    }
    
    func makeTableView() -> TableViewing {
        return DSTableViewAdapter()
    }
    
    func makeCollectionView() -> CollectionViewing {
        return DSCollectionViewAdapter(scroll: .horizontal, spacing: 10)
    }
    
    func makeActivityIndicator() -> LoadingIndicatable {
        return DSActivityIndicatorAdapter()
    }
    
    func makeImageView() -> ImageViewing {
        return DSImageViewAdapter(image: .placeholder)
    }
    
    func makeSearchBar() -> SearchBaring {
        return DSSearchBarAdapter()
    }
    
    func makeSegmentedControling() -> SegmentedControling {
        return DSSegmentedControlAdapter()
    }
}

protocol HttpServicesInterface {
    func makeLoginSErvice() -> LoginServicing
    func makeRegisterService() -> RegisterService
    func makeHomeService() -> HomeServicing
    func makeDetailsService() -> DetailsServicing
    func makeProfileService() -> ProfileServicing
    func makeFavoritesService() -> FavoritesService
}

final class HttpServices: HttpServicesInterface {
    func makeRegisterService() -> RegisterService {
        return RegisterService()
    }
    
    func makeFavoritesService() -> FavoritesService {
        return FavoritesService()
    }
    
    func makeProfileService() -> ProfileServicing {
        return ProfileService()
    }
    
    func makeHomeService() -> HomeServicing {
        return HomeService()
    }
    
    func makeDetailsService() -> DetailsServicing {
        return DetailsService()
    }
    
    func makeLoginSErvice() -> LoginServicing {
        return LoginService()
    }
}

// MARK: - 2. Protocolos para declarar dependências

// Cada protocolo abaixo representa uma dependência que pode ser usada
protocol HasDesignSystemComponentsInterface {
    var designSystemComponents: DesignSystemComponentsInterface { get }
}

protocol HasHttpServicesInterface {
    var httpServices: HttpServicesInterface { get }
}

// Protocolo vazio para compor facilmente tipos de dependência
public protocol HasNoDependency {}

// Combinação das dependências necessárias
typealias Dependencies = HasNoDependency
    & HasDesignSystemComponentsInterface
    & HasHttpServicesInterface

// MARK: - 3. Container de dependências (injeção)

/// Container responsável por fornecer as dependências usando o resolver
final class DependencyContainer: Dependencies {
    private let resolver: DependencyResolving

    // Lazy resolve: resolve apenas quando acessado
    lazy var designSystemComponents: DesignSystemComponentsInterface = resolver.resolve()
    lazy var httpServices: HttpServicesInterface = resolver.resolve()

    init(resolver: DependencyResolving = Resolver.shared) {
        self.resolver = resolver
    }
}

// MARK: - 4. Resolver: Registro e resolução de dependências

/// Protocolo responsável por fornecer uma dependência do tipo solicitado
public protocol DependencyResolving {
    func resolve<T>() -> T
}

/// Resolver simples com registro e resolução por tipo
public final class Resolver: DependencyResolving {
    
    // Singleton para uso global — com `nonisolated(unsafe)` para evitar warning de concorrência
    nonisolated(unsafe) public static let shared: DependencyResolving = Resolver()

    // Armazena instâncias registradas
    private var registry: [String: Any] = [:]

    // Inicializa e registra instâncias padrão
    private init() {
        register(DesignSystemComponents() as DesignSystemComponentsInterface)
        register(HttpServices() as HttpServicesInterface)
    }

    /// Resolve uma dependência registrada pelo tipo solicitado
    public func resolve<T>() -> T {
        let key = "\(T.self)"
        guard let dependency = registry[key] as? T else {
            fatalError("No registered dependency for type: \(T.self)")
        }
        return dependency
    }

    /// Registra uma instância para um tipo específico
    public func register<T>(_ dependency: T) {
        let key = "\(T.self)"
        registry[key] = dependency
    }
}
