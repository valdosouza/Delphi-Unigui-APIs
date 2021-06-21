inherited SeaCountry: TSeaCountry
  ClientHeight = 507
  ClientWidth = 376
  Caption = 'Pesquisa de Pa'#237'ses'
  ExplicitWidth = 392
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 376
    Height = 434
    ExplicitWidth = 376
    ExplicitHeight = 434
    inherited pc_search: TUniPageControl
      Width = 372
      Height = 430
      ExplicitWidth = 372
      ExplicitHeight = 430
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 364
        ExplicitHeight = 402
        inherited pnl_param: TUniPanel
          Width = 364
          Height = 402
          ExplicitWidth = 364
          ExplicitHeight = 402
          object E_Country: TUniEdit
            Left = -1
            Top = 18
            Width = 365
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
          object L_NameCompany: TUniLabel
            Left = 5
            Top = 4
            Width = 27
            Height = 14
            Hint = ''
            Caption = 'Nome'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 364
        ExplicitHeight = 402
        inherited dbg_Search: TUniDBGrid
          Width = 364
          Height = 402
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name'
              Title.Caption = 'Pa'#237's'
              Width = 309
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 434
    Width = 376
    ExplicitTop = 434
    ExplicitWidth = 376
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cds_searchname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
  end
end
