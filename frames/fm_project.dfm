inherited FmProject: TFmProject
  Height = 93
  ExplicitHeight = 93
  inherited pnl_lista: TUniPanel
    Height = 93
    ExplicitHeight = 93
    inherited Sb_Search: TUniSpeedButton
      Height = 68
      OnClick = Sb_SearchClick
      ExplicitHeight = 68
    end
    inherited Sb_Register: TUniSpeedButton
      Height = 68
      OnClick = Sb_RegisterClick
      ExplicitHeight = 68
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Height = 82
      FieldLabel = 'Projetos'
      ExplicitHeight = 82
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 50
    end
  end
end
