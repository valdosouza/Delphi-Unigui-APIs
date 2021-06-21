inherited FmMaterial: TFmMaterial
  Width = 500
  Height = 50
  ExplicitWidth = 500
  ExplicitHeight = 50
  object E_Description: TUniEdit
    Left = 3
    Top = 20
    Width = 364
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object Sb_Register: TUniSpeedButton
    Left = 370
    Top = 20
    Width = 23
    Height = 22
    Hint = ''
    Caption = '...'
    Anchors = [akTop, akRight]
    ParentColor = False
    Color = clWindow
  end
  object Sb_Search: TUniSpeedButton
    Left = 394
    Top = 20
    Width = 23
    Height = 22
    Hint = ''
    Caption = ''
    Anchors = [akTop, akRight]
    ParentColor = False
    Color = clWindow
  end
  object L_NameCompany: TUniLabel
    Left = 3
    Top = 5
    Width = 37
    Height = 14
    Hint = ''
    Caption = 'Material'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 3
  end
end
