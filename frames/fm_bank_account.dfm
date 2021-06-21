inherited FmBankAccount: TFmBankAccount
  Width = 430
  ExplicitWidth = 430
  inherited pnl_lista: TUniPanel
    Width = 430
    ExplicitWidth = 430
    inherited Sb_Search: TUniSpeedButton
      Left = 404
      OnClick = Sb_SearchClick
      ExplicitLeft = 404
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 378
      OnClick = Sb_RegisterClick
      ExplicitLeft = 378
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 369
      ListField = 'id;bank;number;agency;'
      FieldLabel = 'Conta banc'#225'ria'
      ExplicitWidth = 369
    end
  end
end
