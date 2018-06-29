extension WMFContentGroupKind {
    var isInFeed: Bool {
        guard isGlobal else {
            return !feedContentController.languageCodes(for: self).isEmpty
        }
        return feedContentController.isGlobalContentGroupKind(inFeed: self)
    }

    var isCustomizable: Bool {
        return WMFExploreFeedContentController.customizableContentGroupKindNumbers().contains(NSNumber(value: rawValue))
    }

    var isCustomizable: Bool {
        let contentGroupKindNumber = NSNumber(value: self.rawValue)
        return WMFExploreFeedContentController.customizableContentGroupKindNumbers().contains(contentGroupKindNumber)
    }

    var isGlobal: Bool {
        return WMFExploreFeedContentController.globalContentGroupKindNumbers().contains(NSNumber(value: rawValue))
    }

    var languageCodes: Set<String> {
        return feedContentController.languageCodes(for: self)
    }

    private var feedContentController: WMFExploreFeedContentController {
        return SessionSingleton.sharedInstance().dataStore.feedContentController
    }
}
