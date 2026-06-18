//
//  RoutableProtocol.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation
import SwiftUI

/// The Routable protocol is made up of the following needed protocols to can use coordinator pattern on a SwiftUI views
/// View protocol: since coordinators since the objects handled by the coordinators are views
/// The second protocol that makes up the routable protocol is Hash-able, this is necessary for the navigation stack management
/// and routes management
/// The last protocol is Identifiable this is use mainly for the .sheet and .fullScreen presentation modals since this use item parameter
/// to know when should show or dismiss a view so the system needs an unique identifier (ID) to know if the object has been changed,
/// so in short .sheet(item:) y .fullScreenCover(item:): requieres be identifiable to manage the life cycle of the presented view

protocol Routable: View, Hashable, Identifiable {}
