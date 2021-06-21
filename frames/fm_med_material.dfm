inherited FmMedMaterial: TFmMedMaterial
  Width = 397
  Height = 40
  ExplicitWidth = 397
  ExplicitHeight = 40
  inherited pnl_lista: TUniPanel
    Width = 397
    Height = 40
    ExplicitWidth = 397
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 371
      Height = 15
      OnClick = Sb_SearchClick
      ExplicitLeft = 371
      ExplicitTop = 22
      ExplicitHeight = 15
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 345
      Height = 15
      OnClick = Sb_RegisterClick
      ExplicitLeft = 345
      ExplicitTop = 22
      ExplicitHeight = 15
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 336
      Height = 29
      FieldLabel = 'Material'
      ExplicitWidth = 336
      ExplicitHeight = 29
    end
  end
end
