inherited FmPackage: TFmPackage
  Width = 392
  Height = 37
  ExplicitWidth = 392
  ExplicitHeight = 37
  inherited pnl_lista: TUniPanel
    Width = 392
    Height = 37
    ExplicitWidth = 392
    ExplicitHeight = 37
    inherited Sb_Search: TUniSpeedButton
      Left = 366
      Height = 12
      OnClick = Sb_SearchClick
      ExplicitLeft = 366
      ExplicitTop = 22
      ExplicitHeight = 12
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 340
      Height = 12
      OnClick = Sb_RegisterClick
      ExplicitLeft = 340
      ExplicitTop = 22
      ExplicitHeight = 12
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 331
      Height = 26
      ListField = 'id;description'
      FieldLabel = 'Embalagem'
      ExplicitWidth = 331
      ExplicitHeight = 26
    end
  end
end
