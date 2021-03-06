//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `RepoCollectionViewCell`.
    static let repoCollectionViewCell = _R.nib._RepoCollectionViewCell()
    
    /// `UINib(name: "RepoCollectionViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.repoCollectionViewCell) instead")
    static func repoCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.repoCollectionViewCell)
    }
    
    static func repoCollectionViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RepoCollectionViewCell? {
      return R.nib.repoCollectionViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RepoCollectionViewCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `RepoCollectionViewCell`.
    static let repoCollectionViewCell: Rswift.ReuseIdentifier<RepoCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "RepoCollectionViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _RepoCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = RepoCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "RepoCollectionViewCell"
      let name = "RepoCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RepoCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RepoCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MainViewController
      
      let bundle = R.hostingBundle
      let githubReposCollectionViewController = StoryboardViewControllerResource<GithubReposCollectionViewController>(identifier: "GithubReposCollectionViewController")
      let name = "Main"
      
      func githubReposCollectionViewController(_: Void = ()) -> GithubReposCollectionViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: githubReposCollectionViewController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.main().githubReposCollectionViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'githubReposCollectionViewController' could not be loaded from storyboard 'Main' as 'GithubReposCollectionViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
