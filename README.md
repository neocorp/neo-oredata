CKContacts
===========

iOS AddressBook Implementation

An uncomplete iOS AddressBook implementation with HTTP operations to push contacts to a web service.
Provides a template for the base. Could be improved extensively in order to manage contacts within an iOS device.

Calling the entire operation which includes reading Address Book on a device and pushing it to the web service is as simple as this: 

<code>[CKNetworkManager sharedManager] startNetworkOperation];</code>

In order to use the library, just add <code>libContactKit.a</code> to <code>Link Binary With Libraries</code> under <code>Build Phases</code> in Xcode. Then <code>#import "CKNetworkManager.h"</code> to your source and just call it as above. 

A sample project is also included.
