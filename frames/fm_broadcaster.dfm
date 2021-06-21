inherited FmBroadcaster: TFmBroadcaster
  Width = 477
  ExplicitWidth = 477
  inherited pnl_lista: TUniPanel
    Width = 477
    ExplicitTop = 13
    ExplicitWidth = 477
    ExplicitHeight = 38
    inherited Sb_Search: TUniSpeedButton
      Left = 451
      OnClick = Sb_SearchClick
      ExplicitLeft = 451
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 425
      OnClick = Sb_RegisterClick
      ExplicitLeft = 425
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Top = 0
      Width = 416
      Height = 42
      Margins.Top = 0
      ListField = 'id;nick_trade'
      FieldLabel = 'Ve'#237'culo'
      ExplicitTop = 0
      ExplicitWidth = 416
      ExplicitHeight = 42
    end
  end
end
