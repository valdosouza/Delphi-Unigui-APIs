object USM: TUSM
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  TempFolder = 'temp\'
  Port = 8079
  Title = 'Sistema de Gest'#227'o Empresarial'
  DefaultImageFormat = cfPNG
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    'custom\js\HoldOn.min.css'
    'custom\js\HoldOn.min.js'
    'custom\css\chat.css')
  CustomCSS.Strings = (
    '.x-form-text {'
    '    border-radius: 5px;'
    '}'
    '.BotaoBranco'
    '{'
    ' background:#FFFFFF !important;'
    ' color:#fff !important;'
    ' border-color:#d3d3d3;'
    ' -webkit-transition: background 0.5s ease-in-out;'
    ' transition: background 0.5s ease-in-out;'
    '}  '
    '.BotaoBranco:hover{'
    '   background:#f2f2f2 !important;'
    '}'
    '.x-fieldset-header {'
    '    overflow: initial;'
    '}')
  ServerMessages.InvalidSessionMessage = 'Sess'#227'o inv'#225'lida ou Tempo da sess'#227'o expirou'
  ServerMessages.TerminateMessage = 'Sess'#227'o da Web Terminou'
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv3
  SSL.SSLOptions.SSLVersions = [sslvSSLv3]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  Options = [soShowLicenseInfo, soAutoPlatformSwitch, soRestartSessionOnTimeout, soWipeShadowSessions]
  ConnectionFailureRecovery.ErrorMessage = 'Erro de Conex'#227'o'
  ConnectionFailureRecovery.RetryMessage = 'Tentando se reconectar'
  HTTPServerOptions.MaxAliveSecs = 360
  HTTPServerOptions.MaxPoolSize = 600
  Height = 295
  Width = 401
end
