inherited SeaExtMotive: TSeaExtMotive
  ClientWidth = 520
  Caption = 'Pesquisa de Motivos Reprova'#231#227'o/Condena'#231#227'o'
  ExplicitWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 520
    ExplicitWidth = 520
    inherited pc_search: TUniPageControl
      Width = 516
      ExplicitWidth = 516
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 508
        inherited pnl_param: TUniPanel
          Width = 508
          ExplicitWidth = 508
          object UniLabel1: TUniLabel
            Left = 5
            Top = 3
            Width = 20
            Height = 13
            Hint = ''
            Caption = 'Tipo'
            TabOrder = 1
          end
          object Cb_Kind: TUniComboBox
            Left = 5
            Top = 19
            Width = 112
            Hint = ''
            Text = 'Cb_Kind'
            Items.Strings = (
              'CONDENA'#199#195'O'
              'REPROVA'#199#195'O')
            ItemIndex = 0
            TabOrder = 2
            ForceSelection = False
          end
          object E_Description: TUniEdit
            Left = 123
            Top = 19
            Width = 383
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object UniLabel2: TUniLabel
            Left = 123
            Top = 3
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Descri'#231#227'o'
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 508
        inherited dbg_Search: TUniDBGrid
          Width = 508
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'kind'
              Title.Caption = 'Tipo'
              Width = 108
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 604
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 520
    ExplicitWidth = 520
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchkind: TStringField
      FieldName = 'kind'
      Size = 25
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
end
