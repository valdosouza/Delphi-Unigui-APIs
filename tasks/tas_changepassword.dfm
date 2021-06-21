inherited TasChangepassword: TTasChangepassword
  ClientHeight = 293
  ClientWidth = 311
  Caption = 'Troca de Senha'
  BorderStyle = bsSingle
  BorderIcons = []
  ExplicitWidth = 317
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_body: TUniPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 305
    Height = 210
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object pnl_body_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 301
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_CurrentPassWord: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 295
        Height = 46
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Senha Atual'
        FieldLabelAlign = laTop
      end
    end
    object pnl_body_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 301
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_NewPassWord: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 295
        Height = 46
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Nova Senha'
        FieldLabelAlign = laTop
      end
    end
    object pnl_body_row_3: TUniPanel
      Left = 2
      Top = 106
      Width = 301
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object E_ConfirmNewPassWord: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 295
        Height = 46
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Confirme a Nova Senha'
        FieldLabelAlign = laTop
      end
    end
  end
  object pnl_button: TUniPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 219
    Width = 305
    Height = 71
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object SB_Confirm: TUniSpeedButton
      AlignWithMargins = True
      Left = 112
      Top = 5
      Width = 91
      Height = 61
      Hint = ''
      Caption = 'Confirma'
      Align = alRight
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = SB_ConfirmClick
      ExplicitTop = 7
    end
    object Sb_Abort: TUniSpeedButton
      AlignWithMargins = True
      Left = 209
      Top = 5
      Width = 91
      Height = 61
      Hint = ''
      Caption = 'Cancela'
      Align = alRight
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_AbortClick
    end
  end
end
