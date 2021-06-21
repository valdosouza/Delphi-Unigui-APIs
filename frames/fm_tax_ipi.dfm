inherited FmTaxIpi: TFmTaxIpi
  Width = 453
  ExplicitWidth = 453
  inherited pnl_lista: TUniPanel
    Width = 453
    inherited Sb_Search: TUniSpeedButton
      Left = 427
      OnClick = Sb_SearchClick
      ExplicitLeft = 427
      ExplicitTop = 22
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 401
      OnClick = Sb_RegisterClick
      ExplicitLeft = 401
      ExplicitTop = 22
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 392
      ListField = 'id;description'
      ExplicitWidth = 392
    end
  end
end
