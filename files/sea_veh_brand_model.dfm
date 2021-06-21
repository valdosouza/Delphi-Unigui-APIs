inherited SeaVehBrandModel: TSeaVehBrandModel
  ClientHeight = 393
  ClientWidth = 756
  Caption = 'Pesquisa de Marca e Modelo'
  ExplicitWidth = 772
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 756
    Height = 320
    ExplicitWidth = 756
    ExplicitHeight = 320
    inherited pc_search: TUniPageControl
      Width = 752
      Height = 316
      ExplicitWidth = 752
      ExplicitHeight = 316
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 288
        inherited pnl_param: TUniPanel
          Width = 744
          Height = 288
          ExplicitWidth = 744
          ExplicitHeight = 288
          object label2: TUniLabel
            Left = 6
            Top = 6
            Width = 30
            Height = 14
            Hint = ''
            Caption = 'Marca'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_Marca: TUniEdit
            Left = 6
            Top = 21
            Width = 367
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object UniLabel1: TUniLabel
            Left = 377
            Top = 6
            Width = 34
            Height = 14
            Hint = ''
            Caption = 'Modelo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_model: TUniEdit
            Left = 377
            Top = 21
            Width = 367
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 744
        ExplicitHeight = 288
        inherited dbg_Search: TUniDBGrid
          Width = 744
          Height = 288
          Columns = <
            item
              FieldName = 'descriptionVb'
              Title.Caption = 'Marca'
              Width = 604
            end
            item
              FieldName = 'descriptionModel'
              Title.Caption = 'Modelo'
              Width = 364
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 320
    Width = 756
    ExplicitTop = 320
    ExplicitWidth = 756
  end
  inherited cds_search: TClientDataSet
    object cds_searchdescriptionVb: TStringField
      FieldName = 'descriptionVb'
      Origin = 'description'
      Size = 100
    end
    object cds_searchdescriptionModel: TStringField
      FieldName = 'descriptionModel'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
  end
end
