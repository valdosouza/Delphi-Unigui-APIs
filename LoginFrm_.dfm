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
  MonitoredKeys.Keys = <>
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
      Url = 
        'http://www.setes.com.br/wp-content/uploads/2017/10/logo_setes.pn' +
        'g'
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
      Top = 97
      Width = 289
      Height = 164
      Hint = ''
      Visible = False
      Anchors = []
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      DesignSize = (
        289
        164)
      object chbx_keep_conected: TUniCheckBox
        Left = 9
        Top = 109
        Width = 113
        Height = 17
        Hint = ''
        Caption = 'Manter conectado'
        TabOrder = 1
      end
      object email: TUniEdit
        Left = 9
        Top = 45
        Width = 265
        Hint = ''
        CharCase = ecLowerCase
        Text = ''
        TabOrder = 2
      end
      object senha: TUniEdit
        Left = 9
        Top = 85
        Width = 217
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 3
      end
      object UniLabel1: TUniLabel
        Left = 9
        Top = 30
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'e-mail'
        TabOrder = 4
      end
      object UniLabel2: TUniLabel
        Left = 9
        Top = 69
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Senha'
        TabOrder = 5
      end
      object btn_login_ok: TUniButton
        Left = 131
        Top = 131
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        Anchors = [akRight, akBottom]
        TabOrder = 6
        OnClick = btn_login_okClick
      end
      object btn_Login_Cancela: TUniButton
        Left = 206
        Top = 131
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        Anchors = [akRight, akBottom]
        TabOrder = 7
      end
      object UniPanel2: TUniPanel
        Left = 2
        Top = 2
        Width = 285
        Height = 26
        Hint = ''
        Align = alTop
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 8
        Caption = 'Acesso ao Sistema'
        Color = clNavy
      end
    end
  end
end
