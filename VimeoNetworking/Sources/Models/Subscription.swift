//
//  self.swift
//  Pods
//
//  Created by Lim, Jennifer on 2/8/17.
//
//

/// Represents all the notifications that the user is Subscribed to.
open class Subscription: VIMModelObject
{
    // MARK: - Properties
    
    /// Represents wether the user is subscribed to the `comment` notification.
    var comment: NSNumber?
    
    /// Represents wether the user is subscribed to the `credit` notification.
    var credit: NSNumber?
    
    /// Represents wether the user is subscribed to the `like` notification.
    var like: NSNumber?
    
    /// Represents wether the user is subscribed to the `mention` notification.
    var mention: NSNumber?
    
    /// Represents wether the user is subscribed to the `reply` notification.
    var reply: NSNumber?
    
    /// Represents wether the user is subscribed to the `follow` notification.
    var follow: NSNumber?
    
    /// Represents wether the user is subscribed to the `video available` notification.
    var videoAvailable: NSNumber?
    
    /// Represents wether the user is subscribed to the `vod pre order available` notification.
    var vodPreorderAvailable: NSNumber?
    
    /// Represents wether the user is subscribed to the `vod rental expiration warning` notification.
    var vodRentalExpirationWarning: NSNumber?
    
    /// Represents wether the user is subscribed to the `account expiration warning` notification.
    var accountExpirationWarning: NSNumber?
    
    /// Represents wether the user is subscribed to the `share` notification.
    var share: NSNumber?
    
    /// Represents the Subscription object as a Dictionary
    open var toDictionary: [AnyHashable: Any]
    {
        var dictionary = [AnyHashable: Any]()
        dictionary["comment"] = self.comment ?? false
        dictionary["credit"] = self.credit ?? false
        dictionary["like"] = self.like ?? false
        dictionary["mention"] = self.mention ?? false
        dictionary["reply"] = self.reply ?? false
        dictionary["follow"] = self.follow ?? false
        dictionary["vod_preorder_available"] = self.vodPreorderAvailable ?? false
        dictionary["video_available"] = self.videoAvailable ?? false
        dictionary["share"] = self.share ?? false
        return dictionary
    }
    
    // MARK: - VIMMappable
    
    override open func getObjectMapping() -> Any!
    {
        return [
            "video_available": "videoAvailable",
            "vod_preorder_available": "vodPreorderAvailable",
            "vod_rental_expiration_warning": "vodRentalExpirationWarning",
            "account_expiration_warning": "accountExpirationWarning"]
    }
}
