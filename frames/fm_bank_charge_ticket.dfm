inherited FmBankChargeTicket: TFmBankChargeTicket
  Width = 416
  Height = 37
  ExplicitWidth = 416
  ExplicitHeight = 37
  inherited pnl_lista: TUniPanel
    Width = 416
    Height = 37
    inherited Sb_Search: TUniSpeedButton
      Left = 390
      Height = 12
      OnClick = Sb_SearchClick
      ExplicitLeft = 390
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 364
      Height = 12
      OnClick = Sb_RegisterClick
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 355
      Height = 26
      ListField = 'id;description'
      ExplicitWidth = 355
    end
  end
end
