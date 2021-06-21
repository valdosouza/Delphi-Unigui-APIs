inherited FmCollaborator: TFmCollaborator
  Width = 267
  Height = 38
  ExplicitWidth = 267
  ExplicitHeight = 38
  inherited pnl_lista: TUniPanel
    Width = 267
    Height = 38
    ExplicitWidth = 267
    ExplicitHeight = 38
    inherited Sb_Search: TUniSpeedButton
      Left = 215
      Height = 13
      OnClick = Sb_SearchClick
      ExplicitLeft = 215
      ExplicitHeight = 13
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 244
      Height = 13
      OnClick = Sb_RegisterClick
      ExplicitLeft = 244
      ExplicitHeight = 13
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 206
      Height = 27
      ListField = 'id;name_company'
      FieldLabel = 'Colaborador'
      ExplicitWidth = 206
      ExplicitHeight = 27
    end
  end
end
