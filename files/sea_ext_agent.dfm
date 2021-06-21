inherited SeaExtAgent: TSeaExtAgent
  ClientWidth = 448
  Caption = 'Pesquisa Extintor Agente'
  ExplicitWidth = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 448
    ExplicitWidth = 448
    inherited pc_search: TUniPageControl
      Width = 444
      ExplicitWidth = 444
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 436
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 436
          ExplicitWidth = 436
          object chbx_cadAtivo: TUniCheckBox
            Left = 6
            Top = 56
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 1
          end
          object UniLabel1: TUniLabel
            Left = 6
            Top = 17
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Descri'#231#227'o'
            TabOrder = 2
          end
          object E_Description: TUniEdit
            Left = 6
            Top = 32
            Width = 331
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object UniLabel2: TUniLabel
            Left = 343
            Top = 17
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Classe'
            TabOrder = 4
          end
          object E_Class: TUniEdit
            Left = 343
            Top = 32
            Width = 90
            Hint = ''
            Text = ''
            TabOrder = 5
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 436
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 436
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 330
            end
            item
              FieldName = 'class'
              Title.Caption = 'Classe'
              Width = 99
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 448
    ExplicitWidth = 448
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_searchclass: TStringField
      FieldName = 'class'
      Size = 10
    end
  end
end
