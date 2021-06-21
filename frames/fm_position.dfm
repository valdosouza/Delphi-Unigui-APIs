inherited FmPosition: TFmPosition
  Width = 449
  Height = 51
  ExplicitWidth = 449
  ExplicitHeight = 51
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
    TabOrder = 0
  end
  object E_Description: TUniEdit
    Left = 3
    Top = 20
    Width = 364
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
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
end
