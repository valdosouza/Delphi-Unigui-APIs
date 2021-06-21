object UniLogin: TUniLogin
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 838
  Caption = 'Acesso ao Sistema'
  OnShow = UniLoginFormShow
  BorderStyle = bsNone
  WindowState = wsMaximized
  OldCreateOrder = False
  BorderIcons = []
  KeyPreview = True
  MonitoredKeys.Keys = <>
  PageMode = True
  OnAfterShow = UniLoginFormAfterShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_topo: TUniPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 70
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object img_logo: TUniImage
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 225
      Height = 60
      Hint = ''
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Url = 'http://www.setes.com.br/logo_setes.png'
      Align = alLeft
    end
  end
  object pnl_geral: TUniPanel
    Left = 0
    Top = 70
    Width = 838
    Height = 457
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    DesignSize = (
      838
      457)
    object pnl_login: TUniPanel
      Left = 294
      Top = 113
      Width = 289
      Height = 216
      Hint = ''
      Visible = False
      Anchors = []
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      TitleVisible = True
      Title = 'Sistema de Gest'#227'o Empresarial'
      Caption = ''
      object chbx_keep_conected: TUniCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 99
        Width = 279
        Height = 17
        Hint = ''
        Caption = 'Manter conectado'
        Align = alTop
        TabOrder = 1
      end
      object email: TUniEdit
        AlignWithMargins = True
        Left = 5
        Top = 24
        Width = 279
        Hint = ''
        CharCase = ecLowerCase
        Text = ''
        Align = alTop
        TabOrder = 2
        OnKeyDown = emailKeyDown
      end
      object senha: TUniEdit
        AlignWithMargins = True
        Left = 5
        Top = 71
        Width = 279
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Align = alTop
        TabOrder = 3
        OnKeyDown = senhaKeyDown
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'e-mail'
        Align = alTop
        TabOrder = 4
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 52
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Senha'
        Align = alTop
        TabOrder = 5
      end
      object pnl_login_rodape: TUniPanel
        Left = 2
        Top = 150
        Width = 285
        Height = 64
        Hint = ''
        Align = alBottom
        TabOrder = 6
        BorderStyle = ubsNone
        Caption = ''
        object btn_Login_Cancela: TUniButton
          AlignWithMargins = True
          Left = 207
          Top = 3
          Width = 75
          Height = 58
          Hint = ''
          Visible = False
          Caption = 'Cancel'
          ModalResult = 2
          Align = alRight
          TabOrder = 1
        end
        object btn_login_ok: TUniButton
          AlignWithMargins = True
          Left = 56
          Top = 3
          Width = 145
          Height = 58
          Hint = ''
          Caption = 'Acessar o Sistema'
          Align = alRight
          TabOrder = 2
          Images = UMM.uImg32
          ImageIndex = 194
          OnClick = btn_login_okClick
        end
      end
    end
  end
end
