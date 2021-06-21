inherited FmExtMotive: TFmExtMotive
  Width = 292
  Height = 39
  ExplicitWidth = 292
  ExplicitHeight = 39
  inherited pnl_lista: TUniPanel
    Width = 292
    Height = 39
    inherited Sb_Search: TUniSpeedButton
      Left = 240
      Height = 14
      OnClick = Sb_SearchClick
      ExplicitLeft = 240
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 269
      Height = 14
      OnClick = Sb_RegisterClick
      ExplicitLeft = 269
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 231
      Height = 28
      ListField = 'id;description'
      ExplicitWidth = 231
    end
  end
end
