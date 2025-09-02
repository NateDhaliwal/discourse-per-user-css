import { apiInitializer } from "discourse/lib/api";
import Form from "discourse/components/form";

export default apiInitializer((api) => {
  api.addSaveableUserOptionField({
    key: "user_css_code",      // the custom user field name
    default: "",                // default value (empty string for code)
    type: "string",             // type string for code or queries
    label: "Custom CSS code",        // label in the preferences UI
    tab: "interface",             // which preferences tab to show under
    // Optionally add a custom "inputComponent" (for custom UI, see below)
    inputComponent: "form-kit/code"  // If you want a code editor
  });

  api.renderInOutlet(
    "user-preferences-interface",
    <template>
      <Form as |form|>
        <form.Field @name="user_css_code" @title="Custom CSS code" as |field|>
          <field.Code @lang="css" @height={{200}} />
        </form.Field>
      </Form>
    </template>
  );
});
