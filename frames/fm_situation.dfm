inherited FmSituation: TFmSituation
  Width = 398
  Height = 54
  ExplicitWidth = 398
  ExplicitHeight = 54
  inherited pnl_lista: TUniPanel
    Width = 398
    Height = 54
    ExplicitWidth = 398
    ExplicitHeight = 91
    inherited Sb_Search: TUniSpeedButton
      Left = 372
      Height = 29
      OnClick = Sb_SearchClick
      ExplicitLeft = 372
      ExplicitTop = 22
      ExplicitHeight = 66
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 346
      Height = 29
      OnClick = Sb_RegisterClick
      ExplicitLeft = 346
      ExplicitTop = 22
      ExplicitHeight = 66
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 337
      Height = 43
      ListField = 'id;description'
      FieldLabel = 'Situa'#231#227'o'
      ExplicitWidth = 337
      ExplicitHeight = 80
    end
  end
end
