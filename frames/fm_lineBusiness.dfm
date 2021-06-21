inherited fmLineBusiness: TfmLineBusiness
  Width = 426
  Height = 40
  ExplicitWidth = 426
  ExplicitHeight = 40
  inherited pnl_lista: TUniPanel
    Width = 426
    Height = 40
    ExplicitWidth = 426
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 400
      Height = 15
      OnClick = Sb_SearchClick
      ExplicitLeft = 400
      ExplicitHeight = 15
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 374
      Height = 15
      OnClick = Sb_RegisterClick
      ExplicitLeft = 374
      ExplicitHeight = 15
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 365
      Height = 29
      ListField = 'id;description'
      FieldLabel = 'Ramos de Atividade'
      FieldLabelFont.Color = clBlack
      ExplicitWidth = 365
      ExplicitHeight = 29
    end
  end
end
