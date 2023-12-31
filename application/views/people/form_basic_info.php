<div class="row">
    <div class="col-md-12">

        <div class="form-group">
            <?php
            $required = ($controller_name == "suppliers") ? "" : "required";
            echo form_label(lang('common_first_name') . ':', 'first_name', array('class' => $required . ' col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                        'class' => 'form-control',
                        'name' => 'first_name',
                        'id' => 'first_name',
                        'value' => $person_info->first_name)
                ); ?>
            </div>
        </div>

        <?php if ($controller_name != 'suppliers') { ?>
        <div class="form-group">
            <?php echo form_label(lang('common_last_name') . ':', 'last_name', array('class' => ' col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                        'class' => 'form-control',
                        'name' => 'last_name',
                        'id' => 'last_name',
                        'value' => $person_info->last_name)
                ); ?>
            </div>
        </div>
        <?php } ?>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name != 'suppliers') { ?>
            <div class="form-group">
                <?php echo form_label(lang('customers_drivers_license_number') . ':', 'license_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'license_number',
                            'id' => 'license_number',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->license_number)
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_drivers_license_state') . ':', 'license_state', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'license_state',
                            'id' => 'license_state',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->license_state)
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_drivers_license_exp_date') . ':', 'license_exp_date', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'license_exp_date',
                            'id' => 'license_exp_date',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->license_exp_date)
                    ); ?>
                </div>
            </div>

            <?php //TODO: In the future, after we determine the best way to handle DOB from the license scanner, update this to better group of fields ?>
            <div class="form-group">
                <?php echo form_label(lang('customers_customer_dob') . ':', 'date_of_birth', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'date_of_birth',
                            'id' => 'date_of_birth',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->date_of_birth)
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_customer_age') . ':', 'age', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'age',
                            'id' => 'age',
                            'type' => 'text',
                            'class' => 'form-control',
                            'readonly' => 'readonly')
                    ); ?>
                </div>
            </div>
        <?php } ?>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name == 'employees') { ?>
            <div class="form-group">
                <?php echo form_label(lang('employees_ssn') . ':', 'ssn', array('class' => 'required col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_ssn(array(
                            'name' => 'ssn',
                            'id' => 'ssn',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->ssn,
                            'autocomplete'=>'off')
                    ); ?>
                </div>
            </div>
        <?php } ?>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name == 'suppliers') { ?>
            <div class="form-group">
                <?php echo form_label(lang('suppliers_state_license_number') . ':', 'state_license_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'state_license_number',
                            'id' => 'state_license_number',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->state_license_number)
                    ); ?>
                </div>
            </div>
            <div class="form-group">
                <?php echo form_label(lang('suppliers_state_regulatory_agency_number') . ':', 'state_regulatory_agency_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'name' => 'state_regulatory_agency_number',
                            'id' => 'state_regulatory_agency_number',
                            'type' => 'text',
                            'class' => 'form-control',
                            'value' => $person_info->state_regulatory_agency_number)
                    ); ?>
                </div>
            </div>
        <?php } ?>

        <div class="form-group">
            <?php echo form_label(lang('common_email') . ':', 'email', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ' . ($controller_name == 'employees' || $controller_name == 'login' ? 'required' : 'not_required'))); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                        'class' => 'form-control',
                        'name' => 'email',
                        'type' => 'text',
                        'id' => 'email',
                        'value' => $person_info->email)
                ); ?>
            </div>
        </div>
        <div class="form-group">
            <?php echo form_label(lang('common_phone_number') . ':', 'phone_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control',
                    'name' => 'phone_number',
                    'id' => 'phone_number',
                    'value' => $person_info->phone_number)); ?>
            </div>
        </div>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name == 'employees') { ?>
            <div class="form-group">
                <?php echo form_label(lang('employees_employee_type').':', 'employee_type', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_dropdown('employee_type', array(
                        'budtender' => lang('employees_employee_type_budtender'),
                        'management' => lang('employees_employee_type_management'),
                        'owner' => lang('employees_employee_type_owner'),
                        'general_employee' => lang('employees_employee_type_general_employee'),
                    ),$person_info->employee_type===NULL ? 'budtender' : $person_info->employee_type, 'class="form-control" id="employee_type"');?>
                </div>
            </div>
        <?php } ?>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name == 'suppliers') { ?>
            <div class="form-group">
                <?php echo form_label(lang('suppliers_supplier_type').':', 'supplier_type', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_dropdown('supplier_type', array(
                        'processor' => lang('suppliers_supplier_type_processor'),
                        'grower' => lang('suppliers_supplier_type_grower'),
                        'dispensary' => lang('suppliers_supplier_type_dispensary'),
                        'vendor' => lang('suppliers_supplier_type_vendor'),
                    ),$person_info->supplier_type===NULL ? 'processor' : $person_info->supplier_type, 'class="form-control" id="supplier_type"');?>
                </div>
            </div>
        <?php } ?>

        <?php if ($this->config->item('cas_store_type') == 'Retailer' && $controller_name == 'customers') { ?>
            <div class="form-group">
                <?php echo form_label(lang('customers_customer_type').':', 'customer_type', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_dropdown('customer_type', array(
                        'REC' => lang('customers_customer_type_recreational'),
                        'MED' => lang('customers_customer_type_medicinal'),
                        'CAR' => lang('customers_customer_type_caregiver'),
                        'MIN' => lang('customers_customer_type_minor_party'),
                        'TEP' => lang('customers_customer_type_temp_patient'),
                    ),$person_info->customer_type===NULL ? 'REC' : $person_info->customer_type, 'class="form-control" id="customer_type"');?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_medicinal_card_number') . ':', 'rx_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'class' => 'form-control',
                            'name' => 'rx_number',
                            'type' => 'text',
                            'id' => 'rx_number',
                            'value' => $person_info->rx_number)
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_medicinal_card_exp_date') . ':', 'rx_exp_date', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'class' => 'form-control',
                            'name' => 'rx_exp_date',
                            'type' => 'text',
                            'id' => 'rx_exp_date',
                            'value' => $person_info->rx_exp_date)
                    ); ?>
                </div>
            </div>

            <div class="form-group">
                <?php echo form_label(lang('customers_club_member_number') . ':', 'med_account_number', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_input(array(
                            'class' => 'form-control',
                            'name' => 'med_account_number',
                            'type' => 'text',
                            'id' => 'med_account_number',
                            'value' => $person_info->med_account_number)
                    ); ?>
                </div>
            </div>
        <?php } ?>

        <div class="form-group">
            <?php echo form_label(lang('common_choose_avatar') . ':', 'image_id', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <ul class="list-unstyled avatar-list">
                    <li>
                        <input type="file" name="image_id" id="image_id" class="filestyle">&nbsp;
                    </li>
                    <li>
                        <?php echo $person_info->image_id ? '<div id="avatar">' . img(array('style' => 'width: 60%', 'src' => app_file_url($person_info->image_id), 'class' => 'img-polaroid img-polaroid-s')) . '</div>' : '<div id="avatar">' . img(array('style' => 'width: 20%', 'src' => base_url() . 'assets/img/avatar.png', 'class' => 'img-polaroid', 'id' => 'image_empty')) . '</div>'; ?>
                    </li>
                </ul>
            </div>
        </div>

        <?php if ($person_info->image_id) { ?>

            <div class="form-group">
                <?php echo form_label(lang('common_del_image') . ':', 'del_image', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label')); ?>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <?php echo form_checkbox(array(
                        'name' => 'del_image',
                        'id' => 'del_image',
                        'class' => 'delete-checkbox',
                        'value' => 1
                    ));
                    echo '<label for="del_image"><span></span></label> ';

                    ?>
                </div>
            </div>

        <?php } ?>


        <div class="form-group">
            <?php echo form_label(lang('common_address_1') . ':', 'address_1', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control',
                    'name' => 'address_1',
                    'id' => 'address_1',
                    'value' => $person_info->address_1)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_address_2') . ':', 'address_2', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control',
                    'name' => 'address_2',
                    'id' => 'address_2',
                    'value' => $person_info->address_2)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_city') . ':', 'city', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control ',
                    'name' => 'city',
                    'id' => 'city',
                    'value' => $person_info->city)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_state') . ':', 'state', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control ',
                    'name' => 'state',
                    'id' => 'state',
                    'value' => $person_info->state)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_zip') . ':', 'zip', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control ',
                    'name' => 'zip',
                    'id' => 'zip',
                    'value' => $person_info->zip)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_country') . ':', 'country', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_input(array(
                    'class' => 'form-control ',
                    'name' => 'country',
                    'id' => 'country',
                    'value' => $person_info->country)); ?>
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label(lang('common_comments') . ':', 'comments', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
            <div class="col-sm-9 col-md-9 col-lg-10">
                <?php echo form_textarea(array(
                        'name' => 'comments',
                        'id' => 'comments',
                        'class' => 'form-control text-area',
                        'value' => $person_info->comments,
                        'rows' => '5',
                        'cols' => '17')
                ); ?>
            </div>
        </div>
        <?php
        if ($this->Location->get_info_for_key('mailchimp_api_key') && $controller_name != "login") {
            $this->load->helper('mailchimp');
            ?>
            <div class="form-group">
                <div class="column">
                    <?php echo form_label(lang('common_mailing_lists') . ':', 'mailchimp_mailing_lists', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                </div>

                <div class="column">
                    <ul style="list-style: none; float:left;">
                        <?php
                        foreach (get_all_mailchimps_lists() as $list) {
                            echo '<li>';
                            echo form_checkbox(array('name' => 'mailing_lists[]',
                                'id' => $list['id'],
                                'value' => $list['id'],
                                'checked' => email_subscribed_to_list($person_info->email, $list['id']),
                                'label' => $list['id']));

                            echo '<label for="' . $list['id'] . '"><span></span></label> ' . $list['name'];
                            echo '</li>';
                        }
                        ?>
                    </ul>
                </div>
                <div class="cleared"></div>
            </div>
            <?php
        }
        ?>


        <?php
        if ($this->Location->get_info_for_key('platformly_api_key') && $controller_name != "login") {
            $this->load->helper('platformly');
            ?>
            <div class="form-group">
                <div class="column">
                    <?php echo form_label(lang('common_segments') . ':', 'platformly_segments', array('class' => 'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
                </div>

                <div class="column">
                    <ul style="list-style: none; float:left;">
                        <?php
                        foreach (get_all_platformly_segments() as $segment) {
                            echo '<li>';
                            echo form_checkbox(array('name' => 'segments[]',
                                'id' => $segment['id'],
                                'value' => $segment['id'],
                                'checked' => email_subscribed_to_segment($person_info->email, $segment['id']),
                                'label' => $segment['id']));

                            echo '<label for="' . $segment['id'] . '"><span></span></label> ' . $segment['name'];
                            echo '</li>';
                        }
                        ?>
                    </ul>
                </div>
                <div class="cleared"></div>
            </div>
            <?php
        }
        ?>
    </div><!-- /col-md-12 -->
</div><!-- /row -->
