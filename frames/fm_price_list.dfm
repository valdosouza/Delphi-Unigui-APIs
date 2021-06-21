inherited FmPriceList: TFmPriceList
  Width = 371
  ExplicitWidth = 371
  inherited pnl_lista: TUniPanel
    Width = 371
    ExplicitWidth = 371
    inherited Sb_Search: TUniSpeedButton
      Left = 319
      OnClick = Sb_SearchClick
      ExplicitLeft = 319
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 348
      OnClick = Sb_RegisterClick
      ExplicitLeft = 348
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 310
      ListField = 'id;description'
      FieldLabel = 'Tabela de Pre'#231'o'
      ExplicitWidth = 310
    end
  end
end
