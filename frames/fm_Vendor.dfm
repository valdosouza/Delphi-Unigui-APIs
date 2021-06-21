inherited FmVendor: TFmVendor
  Width = 515
  Height = 40
  ExplicitWidth = 515
  ExplicitHeight = 40
  object Lb_Descricao: TUniLabel
    Left = 2
    Top = -1
    Width = 92
    Height = 14
    Hint = ''
    Caption = 'Nome do Vendedor'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 0
  end
  object E_Description: TUniEdit
    Left = 2
    Top = 15
    Width = 459
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 1
    ReadOnly = True
  end
  object sb_register: TUniSpeedButton
    Left = 464
    Top = 15
    Width = 23
    Height = 22
    Hint = ''
    Caption = '...'
    ParentColor = False
    Color = clWindow
    OnClick = sb_registerClick
  end
  object sb_search: TUniSpeedButton
    Left = 487
    Top = 15
    Width = 23
    Height = 22
    Hint = ''
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sb_searchClick
  end
end
