import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    self.title = "StreamBeat"

    // El diseno de escritorio ya no depende del ancho de la ventana: el shell
    // (sidebar de 232pt + contenido) se dibuja siempre en macOS, asi que el
    // limite para que no se rompa lo pone la ventana con un tamano minimo.
    self.contentMinSize = NSSize(width: 900, height: 600)
    if windowFrame.width < 900 || windowFrame.height < 600 {
      self.setContentSize(NSSize(width: max(windowFrame.width, 900),
                                 height: max(windowFrame.height, 600)))
    }

    super.awakeFromNib()
  }
}
