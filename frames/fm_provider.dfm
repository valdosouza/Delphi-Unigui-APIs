inherited FmProvider: TFmProvider
  Width = 312
  Height = 35
  ExplicitWidth = 312
  ExplicitHeight = 35
  inherited pnl_lista: TUniPanel
    Width = 312
    Height = 35
    ExplicitWidth = 312
    ExplicitHeight = 35
    inherited Sb_Search: TUniSpeedButton
      Left = 260
      Height = 10
      OnClick = Sb_SearchClick
      ExplicitLeft = 260
      ExplicitTop = 22
      ExplicitHeight = 10
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 289
      Height = 10
      OnClick = Sb_RegisterClick
      ExplicitLeft = 289
      ExplicitTop = 22
      ExplicitHeight = 10
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 251
      Height = 24
      ListField = 'id;name_company'
      FieldLabel = 'Fornecedores'
      ExplicitWidth = 251
      ExplicitHeight = 24
    end
  end
end
