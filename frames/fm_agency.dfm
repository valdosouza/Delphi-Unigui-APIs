inherited FmAgency: TFmAgency
  Width = 427
  ExplicitWidth = 427
  inherited pnl_lista: TUniPanel
    Width = 427
    ExplicitTop = 13
    ExplicitWidth = 427
    ExplicitHeight = 38
    inherited Sb_Search: TUniSpeedButton
      Left = 401
      OnClick = Sb_SearchClick
      ExplicitLeft = 401
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 375
      OnClick = Sb_RegisterClick
      ExplicitLeft = 375
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Top = 0
      Width = 366
      Height = 42
      Margins.Top = 0
      ListField = 'id;nick_trade'
      FieldLabel = 'Ag'#234'ncia'
      ExplicitTop = 0
      ExplicitWidth = 366
      ExplicitHeight = 42
    end
  end
end
