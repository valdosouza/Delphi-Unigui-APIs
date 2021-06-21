inherited TasOrderBudgetPi: TTasOrderBudgetPi
  ClientHeight = 559
  ClientWidth = 712
  Caption = 'Ordem de Or'#231'amento'
  ExplicitWidth = 728
  ExplicitHeight = 618
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 495
    Width = 712
    ExplicitTop = 495
    ExplicitWidth = 712
  end
  inherited pnl_fundo: TUniPanel
    Width = 712
    Height = 153
    Align = alTop
    Anchors = []
    ExplicitWidth = 712
    ExplicitHeight = 153
    DesignSize = (
      712
      153)
    object UniLabel1: TUniLabel
      Left = 6
      Top = 8
      Width = 37
      Height = 13
      Hint = ''
      Caption = 'N'#250'mero'
      Anchors = []
      TabOrder = 1
    end
    object E_number: TUniEdit
      Left = 5
      Top = 25
      Width = 77
      Hint = ''
      Text = ''
      Anchors = []
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 178
      Top = 8
      Width = 40
      Height = 13
      Hint = ''
      Caption = 'Validade'
      Anchors = []
      TabOrder = 3
    end
    object Rg_type: TUniRadioGroup
      Left = 378
      Top = 10
      Width = 143
      Height = 46
      Hint = ''
      Items.Strings = (
        'Jornal'
        'R'#225'dio')
      Anchors = []
      Caption = 'Tipo'
      TabOrder = 4
      Columns = 2
    end
    object UniGroupBox1: TUniGroupBox
      Left = 525
      Top = 8
      Width = 178
      Height = 46
      Hint = ''
      Caption = 'Vencimento/Status da Cota'#231#227'o'
      Anchors = []
      TabOrder = 5
      DesignSize = (
        178
        46)
      object chbx_filed: TUniCheckBox
        Left = 108
        Top = 18
        Width = 73
        Height = 17
        Hint = ''
        Caption = 'Arquivado'
        Anchors = []
        TabOrder = 1
      end
      object dtp_vencimento: TUniDateTimePicker
        Left = 9
        Top = 16
        Width = 89
        Hint = ''
        DateTime = 42934.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = []
        TabOrder = 2
      end
    end
    object Ctn_Agency: TUniContainerPanel
      Left = 1
      Top = 61
      Width = 349
      Height = 40
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      Anchors = []
      TabOrder = 6
    end
    object Ctn_Advertiser: TUniContainerPanel
      Left = 349
      Top = 61
      Width = 354
      Height = 40
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      Anchors = []
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 6
      Top = 102
      Width = 39
      Height = 13
      Hint = ''
      Caption = 'Contato'
      Anchors = []
      TabOrder = 8
    end
    object E_contact: TUniEdit
      Left = 3
      Top = 119
      Width = 220
      Hint = ''
      Text = ''
      Anchors = []
      TabOrder = 9
    end
    object UniLabel5: TUniLabel
      Left = 227
      Top = 102
      Width = 92
      Height = 13
      Hint = ''
      Caption = 'Fone/ Celular / Fax'
      Anchors = []
      TabOrder = 10
    end
    object E_phone: TUniEdit
      Left = 225
      Top = 119
      Width = 212
      Hint = ''
      Text = ''
      Anchors = []
      TabOrder = 11
    end
    object UniLabel6: TUniLabel
      Left = 439
      Top = 102
      Width = 30
      Height = 13
      Hint = ''
      Caption = 'E_Mail'
      Anchors = []
      TabOrder = 12
    end
    object E_email: TUniEdit
      Left = 438
      Top = 119
      Width = 265
      Hint = ''
      Text = ''
      Anchors = []
      TabOrder = 13
    end
    object UniLabel3: TUniLabel
      Left = 86
      Top = 8
      Width = 23
      Height = 13
      Hint = ''
      Caption = 'Data'
      Anchors = []
      TabOrder = 14
    end
    object Dtp_dt_inicial: TUniDateTimePicker
      Left = 86
      Top = 25
      Width = 89
      Hint = ''
      DateTime = 42934.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = []
      TabOrder = 15
    end
    object E_validade: TUniEdit
      Left = 175
      Top = 25
      Width = 204
      Hint = ''
      Text = ''
      Anchors = []
      TabOrder = 16
    end
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 153
    Width = 712
    Height = 342
    Hint = ''
    Align = alClient
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniPanel3: TUniPanel
      Left = 2
      Top = 2
      Width = 708
      Height = 338
      Hint = ''
      Align = alClient
      TabOrder = 1
      Caption = ''
      object UniPageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 706
        Height = 336
        Hint = ''
        ActivePage = UniTabSheet2
        Align = alClient
        TabOrder = 1
        object tab_jr: TUniTabSheet
          Hint = ''
          Caption = 'Jornal e Revista'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          DesignSize = (
            698
            308)
          object dbg_Jr: TUniDBGrid
            Left = 0
            Top = 0
            Width = 698
            Height = 258
            Hint = ''
            DataSource = ds_items_jr
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
            LoadMask.Message = 'Loading data...'
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'name_company'
                Title.Caption = 'Ve'#237'culo'
                Width = 604
              end
              item
                FieldName = 'day'
                Title.Caption = 'Dia'
                Width = 58
              end
              item
                FieldName = 'unit_value'
                Title.Caption = 'Unit.Valor'
                Width = 70
              end
              item
                FieldName = 'table_value'
                Title.Caption = 'Valor Tabela'
                Width = 70
              end
              item
                FieldName = 'aliq_desc'
                Title.Caption = 'Desconto'
                Width = 70
              end
              item
                FieldName = 'nr_column'
                Title.Caption = 'Coluna'
                Width = 37
              end
              item
                FieldName = 'nr_height'
                Title.Caption = 'Altura'
                Width = 34
              end
              item
                FieldName = 'insertion'
                Title.Caption = 'Inser'#231#227'o'
                Width = 64
              end
              item
                FieldName = 'name'
                Title.Caption = 'Cidade'
                Width = 604
              end
              item
                FieldName = 'color'
                Title.Caption = 'color'
                Width = 27
                Visible = False
              end>
          end
          object Sb_Insert_jr: TUniSpeedButton
            Left = 6
            Top = 268
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Inserir'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 1
            OnClick = Sb_Insert_jrClick
          end
          object Sb_Chance_jr: TUniSpeedButton
            Left = 131
            Top = 268
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Alterar'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 2
            OnClick = Sb_Chance_jrClick
          end
          object Sb_Delet_jr: TUniSpeedButton
            Left = 254
            Top = 268
            Width = 129
            Height = 31
            Hint = ''
            Caption = 'Excluir'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 3
            OnClick = Sb_Delet_jrClick
          end
        end
        object tab_rt: TUniTabSheet
          Hint = ''
          Caption = 'Pe'#231'as Radio e Tv'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 256
          ExplicitHeight = 128
          DesignSize = (
            698
            308)
          object dbg_rt: TUniDBGrid
            Left = 0
            Top = 0
            Width = 698
            Height = 258
            Hint = ''
            DataSource = ds_items_rt
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
            LoadMask.Message = 'Loading data...'
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'tb_institution_id'
                Title.Caption = 'tb_institution_id'
                Width = 81
                Visible = False
              end
              item
                FieldName = 'tb_order_id'
                Title.Caption = 'tb_order_id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'name_company'
                Title.Caption = 'Ve'#237'culo'
                Width = 302
              end
              item
                FieldName = 'created_at'
                Title.Caption = 'created_at'
                Width = 112
                Visible = False
              end
              item
                FieldName = 'tb_broadcaster_id'
                Title.Caption = 'tb_broadcaster_id'
                Width = 92
                Visible = False
              end
              item
                FieldName = 'tb_med_pos_prog_id'
                Title.Caption = 'tb_med_pos_prog_id'
                Width = 105
                Visible = False
              end
              item
                FieldName = 'tm_duration'
                Title.Caption = 'Tempo Dura'#231#227'o'
                Width = 91
              end
              item
                FieldName = 'testimonial'
                Title.Caption = 'Testemunhal'
                Width = 92
              end
              item
                FieldName = 'increase_testemonial'
                Title.Caption = 'Aumento Testemunhal'
                Width = 196
              end
              item
                FieldName = 'updated_at'
                Title.Caption = 'updated_at'
                Width = 112
                Visible = False
              end>
          end
          object Sb_insert_rt: TUniSpeedButton
            Left = 3
            Top = 268
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Inserir'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 1
            OnClick = Sb_insert_rtClick
          end
          object UniSpeedButton2: TUniSpeedButton
            Left = 131
            Top = 268
            Width = 127
            Height = 31
            Hint = ''
            Caption = 'Alterar'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 2
            OnClick = UniSpeedButton2Click
          end
          object UniSpeedButton3: TUniSpeedButton
            Left = 259
            Top = 268
            Width = 129
            Height = 31
            Hint = ''
            Caption = 'Excluir'
            Anchors = []
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            IconAlign = iaTop
            TabOrder = 3
            OnClick = UniSpeedButton3Click
          end
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Outras Informa'#231#245'es'
          object UniPanel4: TUniPanel
            Left = 0
            Top = 0
            Width = 698
            Height = 308
            Hint = ''
            Align = alClient
            TabOrder = 0
            BorderStyle = ubsFrameLowered
            Caption = ''
            DesignSize = (
              698
              308)
            object M_note: TUniMemo
              Left = 12
              Top = 17
              Width = 326
              Height = 117
              Hint = ''
              Lines.Strings = (
                'M_extra_note')
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel10: TUniLabel
              Left = 12
              Top = 3
              Width = 63
              Height = 13
              Hint = ''
              Caption = 'Observa'#231#245'es'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object Ctn_Payment_Type: TUniContainerPanel
              Left = 340
              Top = 19
              Width = 354
              Height = 40
              Hint = ''
              RTL = True
              ParentRTL = False
              ParentColor = False
              Anchors = []
              TabOrder = 3
            end
            object UniLabel11: TUniLabel
              Left = 348
              Top = 59
              Width = 119
              Height = 13
              Hint = ''
              Caption = 'Respons'#225'vel/ Assinatura'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
            object E_assignature: TUniEdit
              Left = 348
              Top = 73
              Width = 235
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
            end
            object UniLabel12: TUniLabel
              Left = 348
              Top = 98
              Width = 94
              Height = 13
              Hint = ''
              Caption = 'E_mail Responsavel'
              Anchors = []
              TabOrder = 6
            end
            object E_email_resp: TUniEdit
              Left = 348
              Top = 111
              Width = 235
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
            end
            object TUniGroupBox
              Left = 589
              Top = 65
              Width = 107
              Height = 74
              Hint = ''
              Caption = ''
              Anchors = [akTop, akRight]
              TabOrder = 8
              DesignSize = (
                107
                74)
              object UniLabel13: TUniLabel
                Left = 14
                Top = 12
                Width = 51
                Height = 13
                Hint = ''
                Caption = 'Valor Total'
                Anchors = [akTop, akRight]
                TabOrder = 1
              end
              object UniEdit3: TUniEdit
                Left = 14
                Top = 28
                Width = 78
                Hint = ''
                Text = ''
                Anchors = [akTop, akRight]
                TabOrder = 2
              end
              object UniCheckBox1: TUniCheckBox
                Left = 14
                Top = 52
                Width = 84
                Height = 17
                Hint = ''
                Caption = 'Ocutar Total'
                Anchors = [akTop, akRight]
                TabOrder = 3
              end
            end
          end
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 552
    Top = 344
  end
  object cds_items_jr: TClientDataSet
    PersistDataPacket.Data = {
      F20100009619E0BD010000001800000011000000000003000000F20102696404
      000100000000001174625F696E737469747574696F6E5F696404000100000000
      000B74625F6F726465725F696404000100000000001174625F62726F61646361
      737465725F696404000100000000001274625F6D65645F706F735F70726F675F
      6964040001000000000003646179010049000000010005574944544802000200
      090005636F6C6F7201004900000001000557494454480200020003000B746162
      6C655F76616C7565070005000000020008444543494D414C5302000200020005
      5749445448020002000A0009616C69715F646573630700050000000200084445
      43494D414C53020002000200055749445448020002000A000A756E69745F7661
      6C7565070005000000020008444543494D414C53020002000200055749445448
      020002000A00096E725F636F6C756D6E01004900000001000557494454480200
      02000500096E725F686569676874010049000000010005574944544802000200
      050009696E73657274696F6E04000100000000000A637265617465645F617408
      000800000000000A757064617465645F617408000800000000000C6E616D655F
      636F6D70616E790100490000000100055749445448020002006400046E616D65
      01004900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 282
    object cds_items_jrid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_items_jrtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
    end
    object cds_items_jrtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
    end
    object cds_items_jrtb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
      Origin = 'tb_broadcaster_id'
    end
    object cds_items_jrtb_med_pos_prog: TIntegerField
      FieldName = 'tb_med_pos_prog_id'
      Origin = 'tb_med_pos_prog_id'
    end
    object cds_items_jrday: TStringField
      FieldName = 'day'
      Origin = 'day'
      Size = 9
    end
    object cds_items_jrcolor: TStringField
      FieldName = 'color'
      Origin = 'color'
      Size = 3
    end
    object cds_items_jrtable_value: TBCDField
      FieldName = 'table_value'
      Origin = 'table_value'
      Precision = 10
      Size = 2
    end
    object cds_items_jraliq_desc: TBCDField
      FieldName = 'aliq_desc'
      Origin = 'aliq_desc'
      Precision = 10
      Size = 2
    end
    object cds_items_jrunit_value: TBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      Precision = 10
      Size = 2
    end
    object cds_items_jrnr_column: TStringField
      FieldName = 'nr_column'
      Origin = 'nr_column'
      Size = 5
    end
    object cds_items_jrnr_height: TStringField
      FieldName = 'nr_height'
      Origin = 'nr_height'
      Size = 5
    end
    object cds_items_jrinsertion: TIntegerField
      FieldName = 'insertion'
      Origin = 'insertion'
    end
    object cds_items_jrcreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_items_jrupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
    object cds_items_jrname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      Size = 100
    end
    object cds_items_jrname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
  end
  object ds_items_jr: TDataSource
    DataSet = cds_items_jr
    Left = 56
    Top = 338
  end
  object ds_items_rt: TDataSource
    DataSet = cds_items_rt
    Left = 136
    Top = 339
  end
  object cds_items_rt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 283
    object cds_items_rtid: TIntegerField
      FieldName = 'id'
    end
    object cds_items_rttb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
    object cds_items_rtcreated_at: TDateTimeField
      FieldName = 'created_at'
    end
    object cds_items_rttb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
    end
    object cds_items_rttb_med_pos_prog_id: TIntegerField
      FieldName = 'tb_med_pos_prog_id'
    end
    object cds_items_rttm_duration: TStringField
      FieldName = 'tm_duration'
    end
    object cds_items_rtupdated_at: TDateTimeField
      FieldName = 'updated_at'
    end
    object cds_items_rttb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_items_rttestimonial: TStringField
      FieldName = 'testimonial'
    end
    object cds_items_rtincrease_testemonial: TFloatField
      FieldName = 'increase_testemonial'
    end
    object cds_items_rtname_company: TStringField
      FieldName = 'name_company'
      Size = 100
    end
  end
end
