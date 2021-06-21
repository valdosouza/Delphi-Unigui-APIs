inherited SeaStockList: TSeaStockList
  ClientHeight = 519
  ClientWidth = 416
  Caption = 'Pesquisa de Lista de Estoque'
  ExplicitWidth = 432
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 416
    Height = 455
    ExplicitWidth = 416
    ExplicitHeight = 455
    inherited pc_search: TUniPageControl
      Width = 412
      Height = 451
      ExplicitWidth = 412
      ExplicitHeight = 451
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 404
        ExplicitHeight = 423
        inherited pnl_param: TUniPanel
          Width = 404
          Height = 423
          ExplicitWidth = 404
          ExplicitHeight = 423
          object label1: TUniLabel
            Left = 6
            Top = 6
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object label2: TUniLabel
            Left = 64
            Top = 6
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
          object E_ID_Search: TUniEdit
            Left = 6
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 57
            Top = 21
            Width = 347
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 404
        ExplicitHeight = 423
        inherited dbg_Search: TUniDBGrid
          Width = 404
          Height = 423
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 274
            end
            item
              FieldName = 'kind'
              Title.Caption = 'Principal'
              Width = 59
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 455
    Width = 416
    ExplicitTop = 455
    ExplicitWidth = 416
  end
  inherited cds_search: TClientDataSet
    Constraints = <
      item
        FromDictionary = False
      end>
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 45
    end
    object cds_searchkind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      FixedChar = True
      Size = 1
    end
  end
  inherited DSP: TDataSetProvider
    Constraints = False
  end
end
