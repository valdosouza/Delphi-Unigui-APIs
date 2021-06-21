inherited SeaAddressDelivery: TSeaAddressDelivery
  ClientWidth = 757
  Caption = 'Tarefas - Pesquisa Endere'#231'o de Entrega'
  ExplicitWidth = 773
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 757
    ExplicitTop = 0
    ExplicitWidth = 757
    ExplicitHeight = 346
    inherited pc_search: TUniPageControl
      Width = 753
      ExplicitWidth = 753
      ExplicitHeight = 342
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 745
        ExplicitHeight = 314
        inherited pnl_param: TUniPanel
          Width = 745
          ExplicitWidth = 745
          ExplicitHeight = 314
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
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 745
        ExplicitHeight = 314
        inherited dbg_Search: TUniDBGrid
          Width = 745
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome da Empresa'
              Width = 270
              ReadOnly = True
            end
            item
              FieldName = 'street'
              Title.Caption = 'Rua'
              Width = 194
            end
            item
              FieldName = 'name'
              Title.Caption = 'Pa'#237's'
              Width = 63
              ReadOnly = True
            end
            item
              FieldName = 'name_1'
              Title.Caption = 'Estado'
              Width = 84
              ReadOnly = True
            end
            item
              FieldName = 'name_2'
              Title.Caption = 'Cidade'
              Width = 75
              ReadOnly = True
            end
            item
              FieldName = 'nmbr'
              Title.Caption = 'N'#250'mero'
              Width = 49
            end
            item
              FieldName = 'complement'
              Title.Caption = 'Complemento'
              Width = 136
            end
            item
              FieldName = 'neighborhood'
              Title.Caption = 'Bairro'
              Width = 106
            end
            item
              FieldName = 'region'
              Title.Caption = 'Regi'#227'o'
              Width = 122
            end
            item
              FieldName = 'kind'
              Title.Caption = 'Tipo'
              Width = 132
            end
            item
              FieldName = 'zip_code'
              Title.Caption = 'CEP'
              Width = 94
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 757
    ExplicitWidth = 757
  end
  inherited cds_search: TClientDataSet
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
