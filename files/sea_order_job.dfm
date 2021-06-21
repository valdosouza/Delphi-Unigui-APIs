inherited SeaOrderJob: TSeaOrderJob
  ClientWidth = 763
  Caption = 'Pesquisa de Ordem de Obra'
  ExplicitWidth = 779
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 763
    ExplicitWidth = 763
    inherited pc_search: TUniPageControl
      Width = 759
      ExplicitWidth = 759
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 751
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 751
          ExplicitWidth = 751
          object L_Codigo: TUniLabel
            Left = 205
            Top = 8
            Width = 44
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object E_Number: TUniEdit
            Left = 205
            Top = 21
            Width = 72
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Customer: TUniContainerPanel
            Left = 280
            Top = 8
            Width = 471
            Height = 36
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 6
            Top = 6
            Width = 145
            Height = 13
            Hint = ''
            Caption = 'Periodo data de cadastro'
            TabOrder = 4
            OnClick = ChBx_PeriodoClick
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 5
            Top = 21
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 5
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 104
            Top = 21
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 751
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 751
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 83
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data Cadastro'
              Width = 107
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 230
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome cliente'
              Width = 264
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 763
    ExplicitWidth = 763
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = 'number'
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
