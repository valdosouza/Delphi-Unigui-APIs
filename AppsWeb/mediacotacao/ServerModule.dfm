object USM: TUSM
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  TempFolder = 'temp\'
  Port = 8072
  Title = 'Aplicativo Cota'#231#227'o On-Line'
  DefaultImageFormat = cfPNG
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    'assets\css\toggles\toggle.css'
    'assets\css\buttons\button.css'
    'assets\js\cotacao.js'
    
      'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/fo' +
      'nt-awesome.min.css'
    'https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'
    
      'https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2ca' +
      'nvas.js'
    
      'https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug' +
      '.js')
  CustomCSS.Strings = (
    '<style>'
    '.button'
    '{'
    ' background:#1892d1 !important;'
    ' color:#fff !important;'
    ' -webkit-transition: background 0.5s ease-in-out;'
    ' transition: background 0.5s ease-in-out;'
    ' font-weight: 900;'
    '  margin:5px;'
    '}'
    '.button:hover'
    '{'
    ' background:#828282 !important;'
    ' -webkit-transition: background 0.5s ease-in-out;'
    ' transition: background 0.5s ease-in-out;'
    '}'
    '.buttonRed'
    '{'
    ' background:#ff0000 !important;'
    ' color:#fff !important;'
    ' -webkit-transition: background 0.5s ease-in-out;'
    ' transition: background 0.5s ease-in-out;'
    ' font-weight: 900;'
    ' margin:5px;'
    '}'
    '.buttonRed:hover'
    '{'
    ' background:#1892d1!important;'
    ' -webkit-transition: background 0.5s ease-in-out;'
    ' transition: background 0.5s ease-in-out;'
    '}'
    '</style>')
  ServerMessages.InvalidSessionMessage = 'Sess'#227'o inv'#225'lida ou Tempo da sess'#227'o expirou'
  ServerMessages.TerminateMessage = 'Sess'#227'o da Web Terminou'
  ExtLocale = 'pt_PT'
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv3
  SSL.SSLOptions.SSLVersions = [sslvSSLv3]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  Options = [soShowLicenseInfo, soAutoPlatformSwitch, soRestartSessionOnTimeout]
  ConnectionFailureRecovery.ErrorMessage = 'Erro de Conex'#227'o'
  ConnectionFailureRecovery.RetryMessage = 'Tentando se reconectar'
  HTTPServerOptions.MaxAliveSecs = 360
  HTTPServerOptions.MaxPoolSize = 600
  Height = 295
  Width = 401
end
