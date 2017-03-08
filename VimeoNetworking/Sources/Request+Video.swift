//
//  Request+Video.swift
//  VimeoNetworkingExample-iOS
//
//  Created by Huebner, Rob on 4/5/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// `Request` returning a single `VIMVideo`
public typealias VideoRequest = Request<VIMVideo>

/// `Request` returning an array of `VIMVideo`
public typealias VideoListRequest = Request<[VIMVideo]>

public extension Request
{
    fileprivate static var QueryKey: String { return "query" }
    
    fileprivate static var VideosPath: String { return "/videos" }
    
    // MARK: - 
    
    /**
     Create a `Request` to get a specific video
     
     - parameter videoURI: the video's URI
     
     - returns: a new `Request`
     */
    public static func getVideoRequest(videoURI: String) -> Request
    {
        return Request(path: videoURI)
    }
    
    /**
     Create a `Request` to get a password protected video
     
     - parameter videoURI: the URI of the video
     - parameter password: the password for the video
     
     - returns: a new `Request`
     */
    static func passwordProtectedVideoRequest(videoURI: String, password: String) -> Request
    {
        let parameters = ["password": password]
        
        return Request(path: videoURI, parameters: parameters as AnyObject?)
    }
    
    /**
     Create a `Request` to get a specific VOD video
     
     - parameter vodVideoURI: the VOD video's URI
     
     - returns: a new `Request`
     */
    static func vodVideoRequest(vodVideoURI: String) -> Request
    {
        let parameters = ["_video_override": "true"]
        
        return Request(path: vodVideoURI, parameters: parameters as AnyObject?)
    }
    
    /**
     Create a `Request` to get the selected users for the vieo
     
     - parameter videoURI: the URI of the video
     
     - returns: a new `Request`
     */
    static func selectedUsersRequest(videoURI: String) -> Request
    {
        let parameters = [VimeoClient.PerPageKey: 100]
        
        return Request(path: videoURI, parameters: parameters as AnyObject?)
    }
    
    // MARK: - Search
    
    /**
     Create a `Request` to search for videos
     
     - parameter query:       the string query to use for the search
     - parameter refinements: optionally, refinement parameters to add to the search
     
     - returns: a new `Request`
     */
    public static func queryVideos(query: String, refinements: VimeoClient.RequestParametersDictionary? = nil) -> Request
    {
        var parameters = refinements ?? [:]
        
        parameters[self.QueryKey] = query as AnyObject?
        
        return Request(path: self.VideosPath, parameters: parameters as AnyObject?)
    }
    
    // MARK: - Edit Video
    
    /**
     Create a `Request` to update a video's metadata
     
     - parameter videoURI:   the URI of the video to update
     - parameter parameters: the updated parameters
     
     - returns: a new `Request`
     */
    public static func patchVideoRequest(videoURI: String, parameters: VimeoClient.RequestParametersDictionary) -> Request
    {
        return Request(method: .PATCH, path: videoURI, parameters: parameters as AnyObject?)
    }
    
    /**
     Create a `Request` to delete a video
     
     - parameter videoURI: the URI of the video to update
     
     - returns: a new `Request`
     */
    public static func deleteVideoRequest(videoURI: String) -> Request
    {
        return Request(method: .DELETE, path: videoURI)
    }
}
