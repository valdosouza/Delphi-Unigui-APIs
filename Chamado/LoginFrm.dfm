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
      Height = 248
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
        Top = 141
        Width = 279
        Height = 17
        Hint = ''
        Caption = 'Manter conectado'
        Align = alTop
        TabOrder = 1
      end
      object pnl_login_rodape: TUniPanel
        AlignWithMargins = True
        Left = 5
        Top = 189
        Width = 279
        Height = 54
        Hint = ''
        Align = alBottom
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        object btn_Login_Cancela: TUniButton
          AlignWithMargins = True
          Left = 201
          Top = 3
          Width = 75
          Height = 48
          Hint = ''
          Visible = False
          Caption = 'Cancel'
          ModalResult = 2
          Align = alRight
          TabOrder = 1
        end
        object btn_login_ok: TUniButton
          AlignWithMargins = True
          Left = 71
          Top = 3
          Width = 124
          Height = 48
          Hint = ''
          Caption = 'Acessar o Sistema'
          Align = alRight
          TabOrder = 2
          ImageIndex = 194
          OnClick = btn_login_okClick
        end
      end
      object pnl_row_1: TUniPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 279
        Height = 62
        Hint = ''
        Align = alTop
        TabOrder = 3
        BorderStyle = ubsNone
        Caption = ''
        object email: TUniEdit
          Left = 0
          Top = 0
          Width = 279
          Height = 62
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          CharCase = ecLowerCase
          Text = ''
          Align = alClient
          TabOrder = 1
          FieldLabel = 'informe seu e-mail'
          FieldLabelAlign = laTop
          OnKeyDown = emailKeyDown
        end
      end
      object pnl_row_2: TUniPanel
        AlignWithMargins = True
        Left = 5
        Top = 73
        Width = 279
        Height = 62
        Hint = ''
        Align = alTop
        TabOrder = 4
        BorderStyle = ubsNone
        Caption = ''
        object senha: TUniEdit
          Left = 0
          Top = 0
          Width = 279
          Height = 62
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          PasswordChar = '*'
          Text = ''
          Align = alClient
          TabOrder = 1
          FieldLabel = 'Senha'
          FieldLabelAlign = laTop
          OnKeyDown = senhaKeyDown
        end
      end
    end
  end
end
