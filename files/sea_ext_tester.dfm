inherited SeaExtTester: TSeaExtTester
  ClientWidth = 468
  Caption = 'Pesquisa do Ensaiador'
  ExplicitWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 468
    ExplicitWidth = 468
    inherited pc_search: TUniPageControl
      Width = 464
      ExplicitWidth = 464
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 456
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 456
          ExplicitWidth = 456
          object UniLabel1: TUniLabel
            Left = 4
            Top = 1
            Width = 92
            Height = 13
            Hint = ''
            Caption = 'Nome do Ensaiador'
            TabOrder = 1
          end
          object E_name_company: TUniEdit
            Left = 4
            Top = 16
            Width = 437
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object chbx_cad_active: TUniCheckBox
            Left = 4
            Top = 41
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 3
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 456
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 456
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'tester'
              Title.Caption = 'Ensaiador'
              Width = 604
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 468
    ExplicitWidth = 468
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchtester: TStringField
      FieldName = 'tester'
      ReadOnly = True
      Size = 100
    end
  end
end
