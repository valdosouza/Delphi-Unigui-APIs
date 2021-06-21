inherited SeaAdress: TSeaAdress
  Caption = 'SeaAdress'
  ExplicitWidth = 320
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 49
    Height = 423
    ExplicitTop = 49
    ExplicitHeight = 423
    inherited dbg_Search: TUniDBGrid
      Height = 419
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'name_company'
          Title.Caption = 'Nome da Empresa'
          Width = 270
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'street'
          Title.Caption = 'Rua'
          Width = 194
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'name'
          Title.Caption = 'Pa'#237's'
          Width = 63
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'name_1'
          Title.Caption = 'Estado'
          Width = 84
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'name_2'
          Title.Caption = 'Cidade'
          Width = 75
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'nmbr'
          Title.Caption = 'N'#250'mero'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'complement'
          Title.Caption = 'Complemento'
          Width = 136
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'neighborhood'
          Title.Caption = 'Bairro'
          Width = 106
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'region'
          Title.Caption = 'Regi'#227'o'
          Width = 122
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'kind'
          Title.Caption = 'Tipo'
          Width = 132
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'zip_code'
          Title.Caption = 'CEP'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Height = 49
    ExplicitTop = -4
    ExplicitHeight = 49
    object label2: TUniLabel
      Left = 6
      Top = 4
      Width = 87
      Height = 14
      Hint = ''
      Caption = 'Nome da Empresa'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Description: TUniEdit
      Left = 6
      Top = 18
      Width = 500
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited cds_search: TClientDataSet
    Active = True
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchstreet: TStringField
      FieldName = 'street'
      Origin = 'street'
      Size = 100
    end
    object cds_searchname: TStringField
      FieldName = 'name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchname_1: TStringField
      FieldName = 'name_1'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchname_2: TStringField
      FieldName = 'name_2'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchnmbr: TStringField
      FieldName = 'nmbr'
      Origin = 'nmbr'
      Required = True
      Size = 10
    end
    object cds_searchcomplement: TStringField
      FieldName = 'complement'
      Origin = 'complement'
      Required = True
      Size = 100
    end
    object cds_searchneighborhood: TStringField
      FieldName = 'neighborhood'
      Origin = 'neighborhood'
      Size = 100
    end
    object cds_searchregion: TStringField
      FieldName = 'region'
      Origin = 'region'
      Size = 100
    end
    object cds_searchkind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object cds_searchzip_code: TStringField
      FieldName = 'zip_code'
      Origin = 'zip_code'
      Size = 15
    end
  end
end
