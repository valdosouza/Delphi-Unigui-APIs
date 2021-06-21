inherited FmAddressList: TFmAddressList
  Width = 283
  ExplicitWidth = 283
  inherited pnl_lista: TUniPanel
    Width = 283
    ExplicitWidth = 283
    inherited Sb_Search: TUniSpeedButton
      Left = 231
      OnClick = Sb_SearchClick
      ExplicitLeft = 231
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 260
      OnClick = Sb_RegisterClick
      ExplicitLeft = 260
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 222
      FieldLabel = 'Lista de Endere'#231'os'
      ExplicitWidth = 222
    end
  end
end
