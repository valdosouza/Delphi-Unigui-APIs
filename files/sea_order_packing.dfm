inherited SeaOrderPacking: TSeaOrderPacking
  ClientWidth = 676
  Caption = 'Pesquisa de Ordem de Romaneio'
  ExplicitWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 676
    ExplicitWidth = 676
    inherited pc_search: TUniPageControl
      Width = 672
      ExplicitWidth = 672
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 664
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 664
          ExplicitWidth = 664
          object ChBx_Periodo: TUniCheckBox
            Left = 5
            Top = 5
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 1
            OnClick = ChBx_PeriodoClick
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 5
            Top = 20
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 104
            Top = 20
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object E_Number: TUniEdit
            Left = 203
            Top = 20
            Width = 72
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object L_Codigo: TUniLabel
            Left = 203
            Top = 5
            Width = 44
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            TabOrder = 5
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 274
            Top = 7
            Width = 390
            Height = 37
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object Ctn_Situation: TUniContainerPanel
            Left = 4
            Top = 47
            Width = 396
            Height = 37
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 664
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 664
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 55
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Entidade'
              Width = 303
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 299
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 676
    ExplicitWidth = 676
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      ReadOnly = True
      Size = 100
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      ReadOnly = True
      Size = 100
    end
  end
end
