inherited FmExtAgent: TFmExtAgent
  Width = 232
  Height = 38
  ExplicitWidth = 232
  ExplicitHeight = 38
  inherited pnl_lista: TUniPanel
    Width = 232
    Height = 38
    ExplicitWidth = 232
    inherited Sb_Search: TUniSpeedButton
      Left = 180
      Height = 13
      OnClick = Sb_SearchClick
      ExplicitLeft = 180
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 209
      Height = 13
      OnClick = Sb_RegisterClick
      ExplicitLeft = 209
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 171
      Height = 27
      ListField = 'description;class'
      ExplicitWidth = 171
    end
  end
end
