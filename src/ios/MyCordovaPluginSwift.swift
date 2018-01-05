// import iOSDFULibrary


@objc(MySwiftPlugin) class MySwiftPlugin : CDVPlugin {
  @objc(echo:)
  func echo(command: CDVInvokedUrlCommand) {

    DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            // 1
            let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
            
            // 2
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.sendMessage(msg: "File Deleted", cmd : command)
            })

            let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
               
                self.sendMessage(msg: "File Saved", cmd : command)
            })
            
            //
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                 self.sendErrorMessage(msg: "Cancelled", cmd : command)
            })
            
            
            // 4
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenu.addAction(cancelAction)
            
            // 5
            self.viewController?.present(optionMenu, animated: true, completion: nil)
            
            
            // DispatchQueue.main.async {
            //     print("This is run on the main queue, after the previous code in outer block")
            // }
        }


  }
  


  func sendMessage(msg: String, cmd : CDVInvokedUrlCommand){

    let pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: msg
    )

    self.commandDelegate!.send(
      pluginResult,
      callbackId: cmd.callbackId
    )

  }


  func sendErrorMessage(msg: String, cmd : CDVInvokedUrlCommand){

    let  pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR,
        messageAs: msg
    )

    self.commandDelegate!.send(
      pluginResult,
      callbackId: cmd.callbackId
    )

  }



}