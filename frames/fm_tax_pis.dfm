inherited FmTaxPis: TFmTaxPis
  Width = 373
  Height = 40
  ExplicitWidth = 373
  ExplicitHeight = 40
  inherited pnl_lista: TUniPanel
    Width = 373
    Height = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 321
      Height = 15
      OnClick = Sb_SearchClick
      ExplicitLeft = 321
      ExplicitTop = 22
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 350
      Height = 15
      OnClick = Sb_RegisterClick
      ExplicitLeft = 350
      ExplicitTop = 22
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 312
      Height = 29
      ListField = 'id;description'
      ExplicitWidth = 312
    end
  end
end
