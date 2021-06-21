inherited SeaOrderPi: TSeaOrderPi
  ClientHeight = 478
  ClientWidth = 799
  Caption = 'Pesquisa de Pedido de Inser'#231#227'o'
  ExplicitWidth = 815
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 799
    Height = 414
    ExplicitWidth = 799
    ExplicitHeight = 414
    inherited pc_search: TUniPageControl
      Width = 795
      Height = 410
      ActivePage = tbs_param
      ExplicitWidth = 795
      ExplicitHeight = 410
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 787
        ExplicitHeight = 382
        inherited pnl_param: TUniPanel
          Width = 787
          Height = 351
          ExplicitWidth = 787
          ExplicitHeight = 351
          object E_nr_original: TUniEdit
            Left = 206
            Top = 21
            Width = 121
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel1: TUniLabel
            Left = 206
            Top = 5
            Width = 71
            Height = 13
            Hint = ''
            Caption = 'Pedido Original'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object E_a_name_company: TUniEdit
            Left = 3
            Top = 109
            Width = 448
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object E_av_name_company: TUniEdit
            Left = 3
            Top = 148
            Width = 448
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object E_bd_name_company: TUniEdit
            Left = 3
            Top = 186
            Width = 448
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object UniLabel5: TUniLabel
            Left = 3
            Top = 92
            Width = 38
            Height = 13
            Hint = ''
            Caption = 'Ag'#234'ncia'
            TabOrder = 6
          end
          object UniLabel6: TUniLabel
            Left = 3
            Top = 133
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Anunciantes'
            TabOrder = 7
          end
          object UniLabel7: TUniLabel
            Left = 3
            Top = 170
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Ve'#237'culo'
            TabOrder = 8
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 108
            Top = 22
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 9
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 5
            Top = 21
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 10
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 3
            Top = 3
            Width = 145
            Height = 13
            Hint = ''
            Caption = 'Periodo data de cadastro'
            TabOrder = 11
          end
          object RG_Data: TUniRadioGroup
            Left = 3
            Top = 45
            Width = 448
            Height = 44
            Hint = ''
            Items.Strings = (
              'Pedido Original'
              'Pedido Sistema'
              'Vencimento')
            Caption = 'Tipo de Datas'
            TabOrder = 12
            Columns = 3
          end
          object UniLabel2: TUniLabel
            Left = 330
            Top = 5
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'Pedido Sistema'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 13
          end
          object E_nr_internal: TUniEdit
            Left = 330
            Top = 21
            Width = 121
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 14
          end
        end
        inherited pnl_config: TUniPanel
          Top = 351
          Width = 787
          ExplicitTop = 351
          ExplicitWidth = 787
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 787
        ExplicitHeight = 382
        inherited dbg_Search: TUniDBGrid
          Width = 787
          Height = 382
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'nr_original'
              Title.Caption = 'Original'
              Width = 63
            end
            item
              FieldName = 'nr_internal'
              Title.Caption = 'Sistema'
              Width = 63
            end
            item
              FieldName = 'agency'
              Title.Caption = 'Agencia'
              Width = 199
              ReadOnly = True
            end
            item
              FieldName = 'advertiser'
              Title.Caption = 'Anunciante'
              Width = 201
              ReadOnly = True
            end
            item
              FieldName = 'broadcaster'
              Title.Caption = 'Ve'#237'culo'
              Width = 233
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 414
    Width = 799
    ExplicitTop = 414
    ExplicitWidth = 799
  end
  inherited ds_msg: TDataSource
    Left = 728
    Top = 200
  end
  inherited ds_search: TDataSource
    Left = 712
    Top = 350
  end
  inherited cds_search: TClientDataSet
    Left = 712
    Top = 303
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchnr_original: TStringField
      FieldName = 'nr_original'
      Size = 30
    end
    object cds_searchnr_internal: TIntegerField
      FieldName = 'nr_internal'
    end
    object cds_searchagency: TStringField
      FieldName = 'agency'
      ReadOnly = True
      Size = 100
    end
    object cds_searchadvertiser: TStringField
      FieldName = 'advertiser'
      ReadOnly = True
      Size = 100
    end
    object cds_searchbroadcaster: TStringField
      FieldName = 'broadcaster'
      ReadOnly = True
      Size = 100
    end
  end
  inherited DSP: TDataSetProvider
    Left = 720
    Top = 255
  end
end
