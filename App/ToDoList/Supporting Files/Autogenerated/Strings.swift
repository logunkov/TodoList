// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable all

internal enum L10n {

  internal enum Alert {

    internal enum Button {
      /// OK
      internal static let ok = L10n.tr("Localizable", "Alert.Button.Ok")
    }

    internal enum Title {
      /// Error
      internal static let error = L10n.tr("Localizable", "Alert.Title.error")
    }
  }

  internal enum Authorization {
    /// Authorization
    internal static let authorization = L10n.tr("Localizable", "Authorization.authorization")
    /// Access denied
    internal static let error = L10n.tr("Localizable", "Authorization.error")
    /// Login
    internal static let login = L10n.tr("Localizable", "Authorization.login")
    /// Password
    internal static let password = L10n.tr("Localizable", "Authorization.password")
    /// Authorization
    internal static let title = L10n.tr("Localizable", "Authorization.title")
  }

  internal enum TodoList {
    /// TodoList
    internal static let title = L10n.tr("Localizable", "TodoList.title")

    internal enum Section {
      /// COMPLETED TASKS
      internal static let complete = L10n.tr("Localizable", "TodoList.Section.complete")
      /// CURRENT TASKS
      internal static let current = L10n.tr("Localizable", "TodoList.Section.current")
    }

    internal enum Task {
      /// Deadline: 
      internal static let deadline = L10n.tr("Localizable", "TodoList.Task.deadline")
    }
  }
}

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
// swiftlint:enable all