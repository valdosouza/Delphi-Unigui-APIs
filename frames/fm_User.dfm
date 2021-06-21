inherited FmUser: TFmUser
  Height = 55
  ExplicitHeight = 55
  inherited pnl_lista: TUniPanel
    Height = 55
    ExplicitHeight = 92
    inherited Sb_Search: TUniSpeedButton
      Height = 30
      OnClick = Sb_SearchClick
      ExplicitTop = 22
      ExplicitHeight = 67
    end
    inherited Sb_Register: TUniSpeedButton
      Height = 30
      OnClick = Sb_RegisterClick
      ExplicitTop = 22
      ExplicitHeight = 67
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Height = 44
      ListField = 'name_company'
      FieldLabel = 'Usu'#225'rios'
      ExplicitHeight = 81
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
end
