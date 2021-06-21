inherited FmAdvertiser: TFmAdvertiser
  Width = 445
  ExplicitWidth = 445
  inherited pnl_lista: TUniPanel
    Width = 445
    ExplicitTop = 13
    ExplicitWidth = 445
    inherited Sb_Search: TUniSpeedButton
      Left = 419
      OnClick = Sb_SearchClick
      ExplicitLeft = 419
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 393
      OnClick = Sb_RegisterClick
      ExplicitLeft = 393
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Top = 0
      Width = 384
      Height = 42
      Margins.Top = 0
      ListField = 'id;nick_trade'
      FieldLabel = 'Anunciante'
      ExplicitTop = 0
      ExplicitWidth = 384
      ExplicitHeight = 42
    end
  end
end
