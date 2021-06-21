inherited SeaExtKind: TSeaExtKind
  ClientHeight = 441
  ClientWidth = 505
  Caption = 'Pesquisa Tipo de Extintor'
  ExplicitWidth = 521
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 505
    Height = 377
    ExplicitWidth = 505
    ExplicitHeight = 368
    inherited pc_search: TUniPageControl
      Width = 501
      Height = 373
      ExplicitWidth = 501
      ExplicitHeight = 364
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 493
        ExplicitHeight = 336
        inherited pnl_param: TUniPanel
          Width = 493
          Height = 336
          ExplicitWidth = 493
          ExplicitHeight = 336
          object E_Description: TUniEdit
            Left = 5
            Top = 22
            Width = 476
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object UniLabel1: TUniLabel
            Left = 5
            Top = 7
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Descri'#231#227'o'
            TabOrder = 2
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 493
        ExplicitHeight = 336
        inherited dbg_Search: TUniDBGrid
          Width = 493
          Height = 336
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'Tipo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 252
              ReadOnly = True
            end
            item
              FieldName = 'class'
              Title.Caption = 'Classe'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'capacity'
              Title.Caption = 'Capacidade'
              Width = 118
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 377
    Width = 505
    ExplicitTop = 368
    ExplicitWidth = 505
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      ReadOnly = True
      Size = 100
    end
    object cds_searchclass: TStringField
      FieldName = 'class'
      ReadOnly = True
      Size = 10
    end
    object cds_searchcapacity: TBCDField
      FieldName = 'capacity'
      Precision = 10
      Size = 2
    end
  end
end
