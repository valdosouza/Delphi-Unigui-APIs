inherited FmBankChargeKind: TFmBankChargeKind
  Width = 347
  Height = 39
  ExplicitWidth = 347
  ExplicitHeight = 39
  inherited pnl_lista: TUniPanel
    Width = 347
    Height = 39
    inherited Sb_Search: TUniSpeedButton
      Left = 295
      Height = 14
      OnClick = Sb_SearchClick
      ExplicitLeft = 295
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 324
      Height = 14
      OnClick = Sb_RegisterClick
      ExplicitLeft = 324
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 286
      Height = 28
      ListField = 'id;description'
      ExplicitWidth = 286
    end
  end
end
